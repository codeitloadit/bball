module(..., package.seeall)

function create()
    local this = {}
    this.radius = 3
    this.x = 70
    this.y = SH/2

    -- Back of rim.
    this.body1 = love.physics.newBody(world, this.x, this.y, 'static')
    this.shape1 = love.physics.newCircleShape(this.radius)
    this.fixture1 = love.physics.newFixture(this.body1, this.shape1)
    this.fixture1:setRestitution(0.82)

    -- Front of rim.
    this.body2 = love.physics.newBody(world, this.x + 128, this.y, 'static')
    this.shape2 = love.physics.newCircleShape(this.radius)
    this.fixture2 = love.physics.newFixture(this.body2, this.shape2)
    this.fixture2:setRestitution(0.42)
    this.body2:setLinearDamping(1)

    -- Backboard.
    this.body3 = love.physics.newBody(world, this.x-40, this.y-100, 'static')
    this.shape3 = love.physics.newRectangleShape(12, 260)
    this.fixture3 = love.physics.newFixture(this.body3, this.shape3)
    this.fixture3:setRestitution(0.62)

    -- Rim Neck.
    this.body4 = love.physics.newBody(world, this.x-20, this.y+3, 'static')
    this.shape4 = love.physics.newRectangleShape(40, 12)
    this.fixture4 = love.physics.newFixture(this.body4, this.shape4)
    this.fixture4:setRestitution(0.82)

    -- Net Back.
    this.body5 = love.physics.newBody(world, this.x+20, this.y+55, 'dynamic')
    this.shape5 = love.physics.newCircleShape(1)
    this.fixture5 = love.physics.newFixture(this.body5, this.shape5, 1000)
    this.body5:setLinearDamping(5)
    joint5 = love.physics.newRopeJoint(this.body1, this.body5, this.body1:getX()*200, this.body1:getY()*200, this.body5:getX()*200, this.body5:getY()*200, 55, true)

    this.body6 = love.physics.newBody(world, this.x+30, this.y+80, 'dynamic')
    this.shape6 = love.physics.newCircleShape(1)
    this.fixture6 = love.physics.newFixture(this.body6, this.shape6, 1000)
    this.body6:setLinearDamping(5)
    joint6 = love.physics.newRopeJoint(this.body5, this.body6, this.body5:getX()*200, this.body5:getY()*200, this.body6:getX()*200, this.body6:getY()*200, 30, true)

    this.body7 = love.physics.newBody(world, this.x+40, this.y+100, 'dynamic')
    this.shape7 = love.physics.newCircleShape(1)
    this.fixture7 = love.physics.newFixture(this.body7, this.shape7, 1000)
    this.body7:setLinearDamping(5)
    joint7 = love.physics.newRopeJoint(this.body6, this.body7, this.body6:getX()*200, this.body6:getY()*200, this.body7:getX()*200, this.body7:getY()*200, 20, true)

    -- Net Front.
    this.body8 = love.physics.newBody(world, this.x+128-20, this.y+55, 'dynamic')
    this.shape8 = love.physics.newCircleShape(1)
    this.fixture8 = love.physics.newFixture(this.body8, this.shape8, 1000)
    this.body8:setLinearDamping(5)
    joint8 = love.physics.newRopeJoint(this.body2, this.body8, this.body2:getX()*200, this.body2:getY()*200, this.body8:getX()*200, this.body8:getY()*200, 55, true)

    this.body9 = love.physics.newBody(world, this.x+128-30, this.y+80, 'dynamic')
    this.shape9 = love.physics.newCircleShape(1)
    this.fixture9 = love.physics.newFixture(this.body9, this.shape9, 1000)
    this.body9:setLinearDamping(5)
    joint9 = love.physics.newRopeJoint(this.body8, this.body9, this.body8:getX()*200, this.body8:getY()*200, this.body9:getX()*200, this.body9:getY()*200, 30, true)

    this.body10 = love.physics.newBody(world, this.x+128-40, this.y+100, 'dynamic')
    this.shape10 = love.physics.newCircleShape(1)
    this.fixture10 = love.physics.newFixture(this.body10, this.shape10, 1000)
    this.body10:setLinearDamping(5)
    joint10 = love.physics.newRopeJoint(this.body9, this.body10, this.body9:getX()*200, this.body9:getY()*200, this.body10:getX()*200, this.body10:getY()*200, 20, true)

    joint0 = love.physics.newRopeJoint(this.body5, this.body8, this.body5:getX()*200, this.body5:getY()*200, this.body8:getX()*200, this.body8:getY()*200, 80, true)
    joint1 = love.physics.newRopeJoint(this.body6, this.body9, this.body6:getX()*200, this.body6:getY()*200, this.body9:getX()*200, this.body9:getY()*200, 65, true)
    joint2 = love.physics.newRopeJoint(this.body7, this.body10, this.body7:getX()*200, this.body7:getY()*200, this.body10:getX()*200, this.body10:getY()*200, 63, true)


    function this:draw()
        g.setColor(200, 60, 50)
        g.circle("fill", this.body1:getX(), this.body1:getY(), this.radius)
        g.circle("fill", this.body2:getX(), this.body2:getY(), this.radius)
        g.polygon("fill", this.body3:getWorldPoints(this.shape3:getPoints()))
        g.polygon("fill", this.body4:getWorldPoints(this.shape4:getPoints()))

        -- g.circle("fill", this.body5:getX(), this.body5:getY(), 2)
        -- g.circle("fill", this.body6:getX(), this.body6:getY(), 2)
        -- g.circle("fill", this.body7:getX(), this.body7:getY(), 2)

        -- g.circle("fill", this.body8:getX(), this.body8:getY(), 2)
        -- g.circle("fill", this.body9:getX(), this.body9:getY(), 2)
        -- g.circle("fill", this.body10:getX(), this.body10:getY(), 2)

        g.setLineWidth(1)
        g.line(this.body1:getX(), this.body1:getY(),this.body5:getX(), this.body5:getY())
        g.line(this.body5:getX(), this.body5:getY(),this.body6:getX(), this.body6:getY())
        g.line(this.body6:getX(), this.body6:getY(),this.body7:getX(), this.body7:getY())

        g.line(this.body2:getX(), this.body2:getY(),this.body8:getX(), this.body8:getY())
        g.line(this.body8:getX(), this.body8:getY(),this.body9:getX(), this.body9:getY())
        g.line(this.body9:getX(), this.body9:getY(),this.body10:getX(), this.body10:getY())

        g.setLineWidth(6)
        g.line(this.body1:getX(), this.body1:getY(),this.body2:getX(), this.body2:getY())
    end

    return this
end
