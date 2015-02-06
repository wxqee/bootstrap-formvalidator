# bootstrap-formvalidator
A very very simple jQuery add-on to validate form fields by their names.

## Usage


### HTML
```html
  <div class="form-group">
    <label class="col-sm-4 control-label">Client</label>
    <div class="col-sm-8">
      <input name="userName" type="text" class="form-control">
      <div class="help-block"></div>
    </div>
  </div><!-- Client -->
```

### COFFEE
```coffee
$ ->

  $('form[name=myForm]').formValidate
    userName:
      validate: (v) -> v != ''
      errorMessage: 'Required.'
```

