Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33357 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932269Ab1EQVeS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 May 2011 17:34:18 -0400
Message-ID: <4DD2E9D9.7030207@suse.cz>
Date: Tue, 17 May 2011 23:34:17 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] kbuild: Integrate with new-kernel-pkg
References: <1305653779-3445-1-git-send-email-asharma@fb.com> <4DD2D0B3.4070208@suse.cz> <20110517204520.GA21201@dev1756.snc6.facebook.com>
In-Reply-To: <20110517204520.GA21201@dev1756.snc6.facebook.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arun Sharma <asharma@fb.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 17.5.2011 22:45, Arun Sharma wrote:
> On Tue, May 17, 2011 at 09:46:59PM +0200, Michal Marek wrote:
>> On 17.5.2011 19:36, Arun Sharma wrote:
>>> Handles mkinitrd, updating the bootloader among other things.
>>
>> This is a Fedora/RHEL specific script, please keep the mkspec script
>> work on any rpm distribution.
> 
> One alternative is to surround it with:
> 
> if [ -x /sbin/new-kernel-pkg ]; then
>  ...
> fi
> 
> and have similar stanzas for other popular rpm based distros.

Or use /sbin/installkernel and let distros handle it.

Michal
