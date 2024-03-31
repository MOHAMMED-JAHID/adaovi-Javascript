CREATE PROCEDURE [dbo].[Insert_UserDetailsnew]    
   @Name VARCHAR(20),    
   @Password VARCHAR(20),    
   @ConfirmPassword VARCHAR(20),    
   @City VARCHAR(30),    
   @Gender VARCHAR(30),    
   @Mail VARCHAR(30),    
   @Mobile VARCHAR(30)    
AS    
BEGIN    
      SET NOCOUNT ON;    
      IF EXISTS(SELECT Name  FROM tbllogin WHERE Name = @Name) --Password,ConfirmPassword,City,Gender,Mail,Mobile    
      BEGIN     
      Raiserror('Name already exists', 11, 1)    
      END    
      ELSE IF EXISTS(SELECT MAIL FROM tbllogin WHERE Mail = @Mail)    
      BEGIN    
      Raiserror('Mail already exists', 11, 1)    
      END    
      ELSE    
      BEGIN    
            INSERT INTO [tbllogin]    
                     ([Name]    
                     ,[Password]    
                     ,[ConfirmPassword]    
                     ,[City]    
      ,[Gender]    
      ,[Mail]    
      ,[Mobile])    
            VALUES    
      (@Name,    
      @Password,    
   @ConfirmPassword,    
      @City,     
   @Gender,     
   @Mail,     
   @Mobile)    
                          
     END    
END