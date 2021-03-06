require 'formula'

# NOTE this should be provided by pip eventually
# currently easy_install doesn't seem to support it

class Sip <Formula
  url 'http://www.riverbankcomputing.co.uk/static/Downloads/sip4/sip-4.9.1.tar.gz'
  homepage 'http://www.riverbankcomputing.co.uk/software/sip'
  md5 '4bd61529a956a08841bb3cc2f949e1c4'

  def install
    system "python", "configure.py", "--destdir=#{lib}/python",
                                     "--bindir=#{bin}",
                                     "--incdir=#{include}"
    system "make install"
  end

  def caveats; <<-EOS
This formula won't function until you add the following to your PYTHONPATH
environment variable:

#{HOMEBREW_PREFIX}/lib/python

Installing with easy_install would be ideal; then the libraries are installed
to /Library/Python which is in the default OS X Python library path. However
easy_install does not support this formula.
    EOS
  end
end
