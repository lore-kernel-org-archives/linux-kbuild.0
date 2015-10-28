Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from washoe.dartmouth.edu ([129.170.30.229]:33967 "EHLO
	smtp.onerussian.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932449AbbJ1MfX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 08:35:23 -0400
Date: Wed, 28 Oct 2015 08:35:21 -0400
From: Yaroslav Halchenko <yoh@onerussian.com>
Subject: Re: doesn't fix for paranoid umask while 'make deb-pkg'
Message-ID: <20151028123521.GU7844@onerussian.com>
References: <20151027165527.GO7844@onerussian.com>
 <56309E75.4070107@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56309E75.4070107@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org


On Wed, 28 Oct 2015, Michal Marek wrote:

> Dne 27.10.2015 v 17:55 Yaroslav Halchenko napsal(a):
> > $> ls -l /usr/include/linux/ | head                          
> > total 3424                         
> > -rw------- 1 root root   7319 Oct 27 11:20 a.out.h
> > -rw------- 1 root root   3670 Oct 27 11:20 acct.h
> > -rw------- 1 root root   1077 Oct 27 11:20 adb.h
> > -rw------- 1 root root    873 Oct 27 11:20 adfs_fs.h
> > -rw------- 1 root root   1481 Oct 27 11:20 affs_hardblocks.h
> > -rw------- 1 root root   3920 Oct 27 11:20 agpgart.h
> > ...

> > So I guess there should be somewhere explicit chmod'ing.  My umask is
> > 077.

> Well, you set umask 077, so nobody will be able to steal your precious
> headers...

when they are in my $HOME that indeed should be the case -- my headers are only
for me to enjoy!

  It is another deal when I am building a package -- pkg building
infrastructure should guarantee correct permissions.  Here is e.g.  what
debhelper (predominant package building tool in Debian) does so my personal
umask preferences do not render generated packages unusable.

$> dpkg -L debhelper | xargs grep chmod 2>/dev/null
/usr/bin/dh:        chmod 4755 debian/foo/usr/bin/foo
/usr/bin/dh:Adding to the example above, suppose you need to chmod a file, but only
/usr/bin/dh:        chmod 4755 debian/foo/usr/bin/foo
/usr/bin/dh_bugfiles:       chmod 0755, $dir;
/usr/bin/dh_bugfiles:       chmod 0755, "$dir/script";
/usr/bin/dh_compress:       xargs(\@f,"chmod","a-x");
/usr/bin/dh_fixperms:       "2>/dev/null | xargs -0r chmod go=rX,u+rw,a-s");
/usr/bin/dh_fixperms:       "| xargs -0r chmod 0644");
/usr/bin/dh_fixperms:       "| xargs -0r chmod 0755");
/usr/bin/dh_fixperms:       "$find_options -print0 2>/dev/null | xargs -0r chmod 0644");
/usr/bin/dh_fixperms:       "2>/dev/null | xargs -0r chmod 0644");
/usr/bin/dh_fixperms:       "2>/dev/null | xargs -0r chmod 0644");
/usr/bin/dh_fixperms:       "2>/dev/null | xargs -0r chmod a-X");
/usr/bin/dh_fixperms:                "| xargs -0r chmod 0644");
/usr/bin/dh_fixperms:                   "| xargs -0r chmod a+x");
/usr/bin/dh_fixperms:       "2>/dev/null | xargs -0r chmod uga-w");
/usr/bin/dh_fixperms:           "2>/dev/null | xargs -0r chmod 644");
/usr/bin/dh_fixperms:           doit('chmod', '0755', "$tmp/usr/share/bug/$package/script");
/usr/bin/dh_fixperms:       doit('chmod', '0755', "$tmp/usr/share/bug/$package");
/usr/bin/dh_fixperms:           "2>/dev/null | xargs -0r chmod 0644");
/usr/bin/dh_fixperms:           "2>/dev/null | xargs -0r chmod 0440");
/usr/bin/dh_gencontrol:     doit("chmod","0644","${ddeb_tmp}/DEBIAN/control");
/usr/bin/dh_gencontrol: # This chmod is only necessary if the user sets the umask to
/usr/bin/dh_gencontrol: doit("chmod","0644","$tmp/DEBIAN/control");
/usr/bin/dh_installchangelogs:              doit("chmod","644","$base/changelog");
/usr/bin/dh_installdeb:         doit("chmod","0644","$tmp/DEBIAN/conffiles");
/usr/bin/dh_installdocs:        doit("chmod","-R","go=rX","$tmp/usr/share/doc");
/usr/bin/dh_installdocs:        doit("chmod","-R","u+rw","$tmp/usr/share/doc");
/usr/bin/dh_installinfo:        doit("chmod","-R", "go=rX","$tmp/usr/share/info/");
/usr/bin/dh_installinfo:        doit("chmod","-R", "u+rw","$tmp/usr/share/info/");
/usr/bin/dh_installman:             doit "chmod", 644, $tmp;
/usr/bin/dh_makeshlibs:     doit("chmod","0644","$tmp/DEBIAN/shlibs");
/usr/bin/dh_md5sums:        doit("chmod", "0644", "$tmp/DEBIAN/md5sums");
/usr/bin/dh_md5sums:            doit('chmod', '0644', "${ddeb_tmp}/DEBIAN/md5sums");
/usr/bin/dh_strip:  doit("chmod", "0644", $debug_path);
/usr/bin/dh_suidregister:           doit("chmod","a-s","$tmp/$file");
/usr/share/debhelper/autoscripts/postinst-menu-method:  chmod a+x $inst
/usr/share/debhelper/autoscripts/postinst-suid:         chmod #PERMS# /#FILE#
/usr/share/debhelper/autoscripts/postinst-usrlocal:             chmod "$mode" "$dir"
/usr/share/debhelper/autoscripts/postrm-menu-method:if [ "$1" = "remove" ] && [ -f "$inst" ]; then chmod a-x $inst ; fi
/usr/share/perl5/Debian/Debhelper/Dh_Lib.pm:        doit("chmod","0755","$tmp/DEBIAN/$script");
/usr/share/perl5/Debian/Debhelper/Dh_Lib.pm:        doit("chmod","0755","$tmp/DEBIAN/$script");
/usr/share/perl5/Debian/Debhelper/Dh_Lib.pm:        chmod($mode, $tfd) || error("cannot chmod $target: $!");


-- 
Yaroslav O. Halchenko
Center for Open Neuroscience     http://centerforopenneuroscience.org
Dartmouth College, 419 Moore Hall, Hinman Box 6207, Hanover, NH 03755
Phone: +1 (603) 646-9834                       Fax: +1 (603) 646-1419
WWW:   http://www.linkedin.com/in/yarik        
