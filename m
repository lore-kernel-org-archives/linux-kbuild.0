Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59167 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927Ab0HSOBh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Aug 2010 10:01:37 -0400
Received: by iwn1 with SMTP id 1so139583iwn.19
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2010 07:01:37 -0700 (PDT)
Date: Thu, 19 Aug 2010 08:26:16 +0530
From: Ramkumar Ramachandra <artagnon@gmail.com>
Subject: Re: [PATCH] scripts/mkversion: Simplify script
Message-ID: <20100819023705.GF3688@kytes>
References: <1282165945-27195-1-git-send-email-artagnon@gmail.com>
 <20100819002006.GA13637@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100819002006.GA13637@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi,

Sam Ravnborg writes:
> On Thu, Aug 19, 2010 at 02:42:25AM +0530, Ramkumar Ramachandra wrote:
> > Simplify the script and add a line to help editors recognize this as a
> > shell script.
> 
> This does not IMO simplify the script.
> The original version is simple to follow for the usual C coder.
> The new version is harder to follow.
> 
> Adding the bangshee (#!/bin/sh) is fine.

Okay, we can drop the patch.
I'll pick up some other janiorial tasks to get into the hang of
writing patches.

-- Ram
