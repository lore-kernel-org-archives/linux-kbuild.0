Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:39691 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753951Ab3CFLQh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Mar 2013 06:16:37 -0500
Received: by mail-wg0-f44.google.com with SMTP id dr12so7347066wgb.35
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Mar 2013 03:16:35 -0800 (PST)
Message-ID: <51372591.1090606@6wind.com>
Date: Wed, 06 Mar 2013 12:16:33 +0100
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Reply-To: nicolas.dichtel@6wind.com
MIME-Version: 1.0
Subject: make headers_install fail when path is too long
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

This problem has probably already been reported, but I don't find the fix in a 
kernel.org tree and I don't understand why.

Here is the problem:

root@schnaps:/home/rbb/averyveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryveryverylongpath/linux(master)>make 
headers_install INSTALL_HDR_PATH=/tmp/tmp/
   CHK     include/generated/uapi/linux/version.h
make[1]: Nothing to be done for `all'.
make[1]: Nothing to be done for `relocs'.
make[2]: execvp: /bin/sh: Argument list too long
make[2]: *** [/tmp/tmp//include/linux/.install] Error 127
make[1]: *** [linux] Error 2
make: *** [headers_install] Error 2

I see that this problem has been reported several times on the web, but I do not 
find why it's not fixed upstream.
Some patches are available: 
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=53cc748b93e8af584557d6db5309c3e955182c5c

Any comment/suggestion is welcome.

Regards,
Nicolas
