Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:49271 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180Ab3FJOTW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Jun 2013 10:19:22 -0400
Received: by mail-wg0-f53.google.com with SMTP id y10so2549784wgg.32
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jun 2013 07:19:21 -0700 (PDT)
Message-ID: <51B5E066.2010009@gmail.com>
Date: Mon, 10 Jun 2013 16:19:18 +0200
From: Gabriel de Perthuis <g2p.code@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Don't run find across mountpoints
References: <51B4A9D1.7070502@gmail.com> <51B5CFAC.6050704@suse.cz> <51B5D180.5080509@gmail.com> <51B5D288.40605@gmail.com> <51B5D336.3070405@suse.cz>
In-Reply-To: <51B5D336.3070405@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Le 10/06/2013 15:23, Michal Marek a écrit :
> On 10.6.2013 15:20, Gabriel de Perthuis wrote:
>> Le 10/06/2013 15:15, Gabriel de Perthuis a écrit :
>>> Le lun. 10 juin 2013 15:07:56 CEST, Michal Marek a écrit :
>>>> What kind of mountpoint zoo do you maintain in your build tree? :) We
>>>> run a find in make clean, make mrproper and other targets. So you might
>>>> need to fix more places. But please explain your use case.
>>>
>>> I happened to be running a fuse thing (git fs, mounted under .git/fs);
>>> recursing that can take a *long* time.
>>>
>>> `find .` is the only one that actually runs into trouble, although it
>>> might be good if -xdev could be the default (through a shell
>>> function maybe?).
> 
> So make deb-pkg saves the md5sums of all files under .git?? Then the
> right fix would be to export RCS_FIND_IGNORE and use it in the builddeb
> script.

Sounds like a good idea.  It doesn't work as is because the backslashes
in \( seem to be delayed by make and can't be used as is, removing the
backslashes doesn't work either, and it takes a long time to test.

