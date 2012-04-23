Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:60033 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754535Ab2DWUOG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Apr 2012 16:14:06 -0400
Date: Mon, 23 Apr 2012 16:13:53 -0400 (EDT)
Message-Id: <20120423.161353.876914987115892015.davem@davemloft.net>
Subject: Re: [GIT] modpost fix for newer toolchain
From: David Miller <davem@davemloft.net>
In-Reply-To: <20120423201226.GA22593@kroah.com>
References: <20120423184918.GA27862@sepie.suse.cz>
	<20120423192201.GA18512@merkur.ravnborg.org>
	<20120423201226.GA22593@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: sam@ravnborg.org, mmarek@suse.cz, torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 23 Apr 2012 13:12:26 -0700

> On Mon, Apr 23, 2012 at 09:22:01PM +0200, Sam Ravnborg wrote:
>> On Mon, Apr 23, 2012 at 08:49:18PM +0200, Michal Marek wrote:
>> > Hi Linus,
>> > 
>> > Please pull this modpost patch. It fixes build failure with newer gcc that adds
>> > some internal symbols that end in "__mod_*_device_table", but are not
>> > actually the tables themselves.
>> > 
>> > Michal
>> > 
>> > The following changes since commit 0eb043d0eec44cd083ea6910b1db2f77eb212ebd:
>> > 
>> >   Subject: [PATCH] tags.sh: Add missing quotes (2012-04-02 11:28:17 +0200)
>> > 
>> > are available in the git repository at:
>> > 
>> >   git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes
>> > 
>> > for you to fetch changes up to e88aa7bbbe3046a125ea1936b16bb921cc9c6349:
>> > 
>> >   Fix modpost failures in fedora 17 (2012-04-18 21:42:07 +0200)
>> 
>> Hi Michal.
>> 
>> The patch missed a "Cc: stable..." as discussed in the thread about
>> said patch.
> 
> What is the git commit id of the patch in Linus's tree that I should add
> to stable?

He didn't pull this in yet, so such commit ID doesn't yet exist :-)
