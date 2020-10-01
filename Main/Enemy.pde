public class Enemy extends Entity 
{
    float health;
    float maxSpeed;
    float bulletSpeed;
    float damage;
    float spawnTime;
    float circleTime;
    boolean isDead;
    EnemyMode mode;
    
    MoveController moveController;

    public Enemy(float health, float damage, PVector position, PVector velocity, EnemyMode mode) 
    {
        this.health = health;
        this.damage = damage;
        this.position = position;
        this.velocity = velocity;
        this.mode = mode;
        this.spawnTime = millis();
        this.circleTime = 5000;
        this.size = 40;
        this.sprite = loadImage("Enemy00.png");

        this.deathAnimation = new PImage[]
        {
            loadImage("Explosion00.png"),
            loadImage("Explosion01.png"),
            loadImage("Explosion02.png"),
            loadImage("Explosion03.png"),
            loadImage("Explosion04.png"),
        };
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