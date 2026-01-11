# How to Run FoodApp Project in Eclipse

## Prerequisites
1. Eclipse IDE for Enterprise Java and Web Developers
2. Apache Tomcat 9.0 (or compatible version)
3. MySQL Database Server
4. JDK 17 (as configured in project)

## Step-by-Step Instructions

### 1. Database Setup
1. Start MySQL Server
2. Create database:
   ```sql
   CREATE DATABASE foodapp;
   ```
3. Make sure your database credentials match in:
   - `src/main/java/com/foodapp/dbUtils/DBUtils.java`
   - `src/main/java/com/foodapp/daoimpl/*.java` files
   - Default: username: `root`, password: `root`

### 2. Configure Tomcat Server in Eclipse
1. In Eclipse, go to **Window → Preferences**
2. Navigate to **Server → Runtime Environments**
3. Click **Add** and select **Apache Tomcat v9.0**
4. Browse to your Tomcat installation directory
5. Click **Finish**

### 3. Add Server to Project
1. Right-click on the **FoodAPP-master** project
2. Select **Properties**
3. Go to **Project Facets**
4. Ensure:
   - **Java** is set to version 17
   - **Dynamic Web Module** is set to version 4.0
5. Click **Apply and Close**

### 4. Build the Project
1. Right-click on **FoodAPP-master** project
2. Select **Build Project** (or press `Ctrl+B`)
3. Wait for build to complete (check for errors in Problems view)

### 5. Add Server and Run
1. In Eclipse, go to **Window → Show View → Servers** (if not visible)
2. Right-click in the Servers view → **New → Server**
3. Select **Apache → Tomcat v9.0 Server**
4. Select your project **FoodAPP-master** and click **Add**
5. Click **Finish**

### 6. Start the Server
1. Right-click on the Tomcat server in Servers view
2. Select **Start** (or click the green play button)
3. Wait for server to start (check Console for "Server startup in XXXX ms")

### 7. Access the Application
1. Open your web browser
2. Navigate to: `http://localhost:8080/FoodAPP-master/`
3. Or directly: `http://localhost:8080/FoodAPP-master/index.html`

## Troubleshooting

### Port 8080 Already in Use
- Stop other applications using port 8080
- Or change Tomcat port in server configuration

### Database Connection Errors
- Verify MySQL is running
- Check database credentials in DBUtils.java
- Ensure database `foodapp` exists

### ClassNotFoundException or Servlet Errors
- Right-click project → **Properties → Java Build Path**
- Add **Tomcat Runtime** to Libraries
- Or: **Project → Clean → Clean all projects**

### 404 Errors
- Ensure project is deployed to server
- Check server deployment path matches URL
- Verify `web.xml` is correct

## Quick Run Command (Alternative)
If you have Tomcat installed separately, you can also:
1. Build the project (Export as WAR file)
2. Copy WAR to Tomcat's `webapps` folder
3. Start Tomcat from command line
4. Access at `http://localhost:8080/FoodAPP-master/`
