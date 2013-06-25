class RadioButtons < PM::Screen
  attr_accessor :data, :frame
  
  def viewDidLoad
    @table = UITableView.alloc.initWithFrame CGRectMake(0,0,frame.size.width, frame.size.height)
    @table.backgroundColor = ControlVariables::ScreenColor
    @table.setSeparatorStyle(UITableViewCellSeparatorStyleNone)
    subview(@table, :radio_buttons_table)
    @table.dataSource = self
    @table.delegate = self
    configure_table if ControlVariables::RadioButtonsMaxCount > self.data.count
    @radio_image_selected_view = get_radio_image_view_for("RadioButton-Selected.png")
  end
  
  def configure_table
    @table.bounces = false
    @table.scrollEnabled = false
    @table.showsVerticalScrollIndicator = false
  end

  def get_radio_image_view_for(image_name)
    radio_image = UIImage.imageNamed(image_name)
    radio_image_view = UIImageView.alloc.initWithImage(radio_image)
    radio_image_view.setFrame(CGRectMake(15, 12, 20,21))
    radio_image_view
  end
  
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end
    cell.selectionStyle = UITableViewCellSelectionStyleNone

    radio_image_view = get_radio_image_view_for("RadioButton-Unselected.png")
    cell.contentView.addSubview(radio_image_view)

    radio_button_label = UILabel.alloc.initWithFrame(CGRectMake(44, 10, 100,21))
    radio_button_label.text = self.data[indexPath.row]
    radio_button_label.setTag 550
    radio_button_label.backgroundColor = ControlVariables::ScreenColor
    cell.contentView.addSubview(radio_button_label)
    cell    
  end

  
  def tableView(tableView, numberOfRowsInSection: section)
    self.data.count
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    cell = @table.cellForRowAtIndexPath(indexPath)
    cell.contentView.addSubview(@radio_image_selected_view)
  end
end