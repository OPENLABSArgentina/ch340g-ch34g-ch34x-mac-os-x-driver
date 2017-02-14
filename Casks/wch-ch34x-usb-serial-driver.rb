cask 'wch-ch34x-usb-serial-driver' do
  version '1.3'
  sha256 'bd506b1095fd3cc5fff292a8fb26629b8678dff795de2d8f8464c948beb9d516'

  url 'https://github.com/adrianmihalko/ch340g-ch34g-ch34x-mac-os-x-driver/raw/master/CH34x_Install_V1.3.zip'
  name 'WCH USB serial driver for CH340/CH341 (unofficial release)'
  homepage 'https://github.com/adrianmihalko/ch340g-ch34g-ch34x-mac-os-x-driver'
  license :gratis


  container type:   :zip,
            nested: 'CH34x_Install_V1.3.pkg'

  pkg 'CH34x_Install_V1.3.pkg'

  uninstall pkgutil: 'com.wch.usbserial.pkg',
            kext:    'com.wch.usbserial',
            delete:  [
                       '/System/Library/Extensions/usb.kext',
                       '/Library/Extensions/usbserial.kext',
                     ]

  caveats <<-EOS.undent
    Warning: This driver was not officially published and its source is
    unclear. Discussion:
    https://github.com/adrianmihalko/ch340g-ch34g-ch34x-mac-os-x-driver
  EOS
end
