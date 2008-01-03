Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from po-out-1718.google.com ([72.14.252.152]:51150 "EHLO
	po-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754545AbYACEh0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Jan 2008 23:37:26 -0500
Received: by po-out-1718.google.com with SMTP id c31so4459906poi.1
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Jan 2008 20:37:26 -0800 (PST)
Date: Thu, 3 Jan 2008 12:37:32 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: Re: [Patch 0/8] Remove 'TOPDIR' from Makefiles
Message-ID: <20080103043732.GA2505@hacking>
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
References: <20080101071311.GA2496@hacking> <20080102095159.GB7815@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080102095159.GB7815@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: WANG Cong <xiyou.wangcong@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@osdl.org>


>Hi Wang.
>
>You a heads up. I will most likely apply
>the remaining of the patches tonight, except the UM stuff
>which I hope Jeff to take and the final removal of TOPDIR
>may wait a bit.
>I want the s390, xfs and um changes to hit -mm at least
>and we have several external modules that uses TOPDIR.
>
>And some of these external modules I care about - not
>all of them but some of them.
>
>	Sam

Thanks, Sam!

 Cong

