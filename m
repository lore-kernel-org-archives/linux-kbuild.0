Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:48204 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751006Ab0KGSJd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Nov 2010 13:09:33 -0500
From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Re: Bus error on make allyesconfig, kernelbuild with HEAD
In-Reply-To: <20101107170700.GA22684@merkur.ravnborg.org>
References: <20100729105225.GA13192@faui48a.informatik.uni-erlangen.de> <AANLkTi=cYgV69VyNZ+TKs_f-+3AJmyo_RaYS57R72j50@mail.gmail.com> <20100729121002.GC13192@faui48a.informatik.uni-erlangen.de> <20100730084353.GB5638@cr0.nay.redhat.com> <87d3qicwxn.fsf@gmail.com> <87aalmcv0p.fsf@gmail.com> <20101106162426.GA14361@merkur.ravnborg.org> <87tyjtjd7m.fsf@gmail.com> <20101107170700.GA22684@merkur.ravnborg.org>
Date: Sun, 07 Nov 2010 13:09:30 -0500
Message-ID: <87mxplypid.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>, Christoph Egger <siccegge@cs.fau.de>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Sun, 7 Nov 2010 18:07:00 +0100, Sam Ravnborg <sam@ravnborg.org> wrote:
> Interesting and valueable information!
> 
> Looks like fstat() failed for some odd reason
> Could you try to check the return value of fstat().
> 
fixdep: fstat failed: Invalid argument

Interesting indeed. According to my manpage fstat doesn't even return
EINVAL.

- Ben
