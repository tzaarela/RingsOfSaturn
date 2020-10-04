public class Enemy extends Entity 
{
    float health;
    float fireCooldown;
    float lastShotTime;
    float ammoLimit;
    float maxSpeed;
    float bulletSpeed;
    float damage;
    float spawnTime;
    float circleTime;
    float patrolTime;
    float startPatrolTime;
    float rotation;
    boolean isDead;
    EnemyMode mode;
    Animation spawnAnimation;
    
    MoveController moveController;

    public Enemy(float health, float damage, PVector position, PVector velocity, EnemyMode mode) 
    {
        this.health = health;
        this.damage = damage;
        this.position = position;
        this.velocity = velocity;
        this.maxSpeed = 100f;
        this.mode = mode;
        this.spawnTime = millis();
        this.circleTime = 25000;
        this.patrolTime = random(1000,5000);
        this.fireCooldown = random(1000, 3000);
        this.size = 50;
        this.sprite = Assets.sprites.get("Enemy");
    }

    void takeDamage(float damage)
    {
        health -= damage;
        if (health <= 0)
        {
            isDead = true;
        }
    }
}

