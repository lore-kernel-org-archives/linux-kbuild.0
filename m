Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outmail003.snc4.facebook.com ([66.220.144.135]:47974 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932244Ab1EQUpV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 May 2011 16:45:21 -0400
Date: Tue, 17 May 2011 13:45:20 -0700
From: Arun Sharma <asharma@fb.com>
Subject: Re: [PATCH 1/6] kbuild: Integrate with new-kernel-pkg
Message-ID: <20110517204520.GA21201@dev1756.snc6.facebook.com>
References: <1305653779-3445-1-git-send-email-asharma@fb.com>
 <4DD2D0B3.4070208@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DD2D0B3.4070208@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arun Sharma <asharma@fb.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 17, 2011 at 09:46:59PM +0200, Michal Marek wrote:
> On 17.5.2011 19:36, Arun Sharma wrote:
> > Handles mkinitrd, updating the bootloader among other things.
> 
> This is a Fedora/RHEL specific script, please keep the mkspec script
> work on any rpm distribution.

One alternative is to surround it with:

if [ -x /sbin/new-kernel-pkg ]; then
 ...
fi

and have similar stanzas for other popular rpm based distros.

 -Arun
