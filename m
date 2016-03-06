Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:34134 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbcCFVEJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Mar 2016 16:04:09 -0500
Received: by mail-lb0-f170.google.com with SMTP id xr8so14147119lbb.1
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Mar 2016 13:04:08 -0800 (PST)
Received: from lenovo.home ([93.171.170.21])
        by smtp.gmail.com with ESMTPSA id z194sm2300129lfd.20.2016.03.06.13.04.05
        for <linux-kbuild@vger.kernel.org>
        (version=TLSv1/SSLv3 cipher=OTHER);
        Sun, 06 Mar 2016 13:04:06 -0800 (PST)
From: Ruslan Kuprieiev <kupruser@gmail.com>
Subject: rela sections in vmlinux
Message-ID: <56DC9B44.6020104@gmail.com>
Date: Sun, 6 Mar 2016 23:04:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi!

I'm trying to figure out how CONFIG_RELOCATABLE works and one of the things
that I've noticed is that vmlinux itself doesn't have any rela sections, 
which is
confusing for me considering the name of the option. I did read the 
patches that
introduced this option but it is still not clear to me how exactly it 
works and why
there are no relocations left in the vmlinux. Could you please give me a 
hint on
why it happens and point me where to read more?

I also see that vmlinux.o has all the rela sections I'm looking for(as 
an object file
should =)), so it raises another question: Is it possible to make 
vmlinux keep that
rela sections? I also went through makefiles but couldn't figure out 
where to
make a proper change to achieve that.

I'm using default 3.10.0-229.20.1.el7.x86_64 centos7 kernel with 
CONFIG_RELOCATABLE
enabled.

Thanks,
Ruslan
