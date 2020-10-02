public class Enemy extends Entity 
{
    int  id;
    float health;
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
        this.maxSpeed = 60f;
        this.mode = mode;
        this.spawnTime = millis();
        this.circleTime = 10000;
        this.patrolTime = 1500;
        this.size = 40;
        this.sprite = Assets.sprites.get("Enemy");
    }

    void takeDamage(float damage)
    {
        println("Enemy taking damage...");
        health -= damage;
        if (health <= 0)
        {
            println("Enemy is dead!");
            isDead = true;
        }
    }
}

enum EnemyMode
{
    isCircling,
    isSuiciding
}