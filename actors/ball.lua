module(..., package.seeall)

function create()
    local this = {}
    this.radius = 32
    this.x = SW - this.radius
    this.y = SH - this.radius

    this.image = love.graphics.newImage("assets/bball.png")
    this.body = love.physics.newBody(world, this.x, this.y, "dynamic")
    this.shape = love.physics.newCircleShape(this.radius)
    this.fixture = love.physics.newFixture(this.body, this.shape, 5)
    -- this.fixture:setRestitution(0.72)
    -- this.fixture:setFriction(0.4)
    this.body:setAngularDamping(1)
    this.body:setLinearDamping(0.1)

    function this:update(dt)
        this.x = this.body:getX()
        this.y = this.body:getY()
    end

    function this:draw()
        g.setColor(255, 255, 255)
        g.draw(this.image, this.x, this.y, this.body:getAngle(), 1, 1, this.radius, this.radius)
    end

    return this
end
