
def index():
    return '''
<!DOCTYPE html>
<html>
  <head>
    <title>PBX config page</title>
  </head>
  <body>
    <h1>PBX config page</h1>
    <form method="POST" action="/trunks">
      <h3>Create trunks</h3>
    </form>
    <form method="POST" action="/run-script1">
        <label for="ip_add">PBX IP:</label>
        <input type="text" id="ip_add" name="ip_add">
        <label for="from_range">From range:</label>
        <input type="text" id="from_range" name="from_range">
        <label for="to_range">To range:</label>
        <input type="text" id="to_range" name="to_range">
        <button type="submit">Send Value</button>
    </form>
  </body>
</html>
    '''
