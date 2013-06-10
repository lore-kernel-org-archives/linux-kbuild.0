Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48042 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752613Ab3FJNXD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Jun 2013 09:23:03 -0400
Message-ID: <51B5D336.3070405@suse.cz>
Date: Mon, 10 Jun 2013 15:23:02 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Don't run find across mountpoints
References: <51B4A9D1.7070502@gmail.com> <51B5CFAC.6050704@suse.cz> <51B5D180.5080509@gmail.com> <51B5D288.40605@gmail.com>
In-Reply-To: <51B5D288.40605@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gabriel de Perthuis <g2p.code@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 10.6.2013 15:20, Gabriel de Perthuis wrote:
> Le 10/06/2013 15:15, Gabriel de Perthuis a écrit :
>> Le lun. 10 juin 2013 15:07:56 CEST, Michal Marek a écrit :
>>> What kind of mountpoint zoo do you maintain in your build tree? :) We
>>> run a find in make clean, make mrproper and other targets. So you might
>>> need to fix more places. But please explain your use case.
>>
>> I happened to be running a fuse thing (git fs, mounted under .git/fs);
>> recursing that can take a *long* time.
>>
>> `find .` is the only one that actually runs into trouble, although it
>> might be good if -xdev could be the default (through a shell
>> function maybe?).

So make deb-pkg saves the md5sums of all files under .git?? Then the
right fix would be to export RCS_FIND_IGNORE and use it in the builddeb
script.


> Or it would be even better if the scripts used `git ls-files`, if
> it seems a reasonable requirement to have the kernel build from git.

No, the build has to work without any git repository.

Michal



