from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time 
options = Options()
#options.add_argument("--headless=new")
driver = webdriver.Chrome(options=options)

newurl = "http://15.185.121.115/admin/config.php?display=sipsettings"

driver.get(newurl)


username = "admin"
password = "admin"

driver.get(newurl)
button = driver.find_element(By.ID,"login_admin")
button.click()
time.sleep(2)
username_field = driver.find_element(By.XPATH,"/html/body/div[15]/div[2]/form/div[1]/input")
password_field = driver.find_element(By.XPATH,"/html/body/div[15]/div[2]/form/div[2]/input")
username_field.send_keys(username)
password_field.send_keys("admin")
#time.sleep(2)
button = driver.find_element(By.XPATH,"/html/body/div[15]/div[3]/div/button[1]")
button.click()
time.sleep(2)
button = driver.find_element(By.XPATH,"/html/body/div[1]/div[3]/form/div/div[2]/div/div/div/div[2]/div[1]/div[6]/div[3]/div[1]/div/div[2]/label[2]")
button.click()
time.sleep(2)
button = driver.find_element(By.XPATH,"/html/body/div[2]/div[1]/div/input[1]")
button.click()
time.sleep(3)
button = driver.find_element(By.XPATH,"/html/body/div[1]/div[1]/nav/div/ul/li[1]/a")
button.click()
time.sleep(10)

driver.quit()
