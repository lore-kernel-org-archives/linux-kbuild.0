Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from washoe.dartmouth.edu ([129.170.30.229]:50336 "EHLO
	smtp.onerussian.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754441AbbJ0R3t (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 13:29:49 -0400
Received: from smtp.onerussian.com ([192.168.100.6] helo=washoe.onerussian.com)
	by smtp.onerussian.com with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <yoh@onerussian.com>)
	id 1Zr7Wx-0003Ds-Qo
	for linux-kbuild@vger.kernel.org; Tue, 27 Oct 2015 12:55:27 -0400
Received: from yoh by washoe.onerussian.com with local (Exim 4.80)
	(envelope-from <yoh@onerussian.com>)
	id 1Zr7Wx-0003Dn-H1
	for linux-kbuild@vger.kernel.org; Tue, 27 Oct 2015 12:55:27 -0400
Date: Tue, 27 Oct 2015 12:55:27 -0400
From: Yaroslav Halchenko <yoh@onerussian.com>
Subject: doesn't fix for paranoid umask while 'make deb-pkg'
Message-ID: <20151027165527.GO7844@onerussian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I have built today custom image packages from
git://anongit.freedesktop.org/drm-intel to troubleshoot complete stalls
of my laptop after recent upgrade and now discovering that header files were
installed without world readable permissions:

$> ls -l /usr/include/linux/ | head                          
total 3424                         
-rw------- 1 root root   7319 Oct 27 11:20 a.out.h
-rw------- 1 root root   3670 Oct 27 11:20 acct.h
-rw------- 1 root root   1077 Oct 27 11:20 adb.h
-rw------- 1 root root    873 Oct 27 11:20 adfs_fs.h
-rw------- 1 root root   1481 Oct 27 11:20 affs_hardblocks.h
-rw------- 1 root root   3920 Oct 27 11:20 agpgart.h
...

So I guess there should be somewhere explicit chmod'ing.  My umask is
077.

-- 
Yaroslav O. Halchenko
Center for Open Neuroscience     http://centerforopenneuroscience.org
Dartmouth College, 419 Moore Hall, Hinman Box 6207, Hanover, NH 03755
Phone: +1 (603) 646-9834                       Fax: +1 (603) 646-1419
WWW:   http://www.linkedin.com/in/yarik        
