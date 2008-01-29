Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:46798 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750794AbYA2FOl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jan 2008 00:14:41 -0500
Date: Tue, 29 Jan 2008 06:14:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 28/77] FRV: Drop 'TOPDIR' from Makefiles
Message-ID: <20080129051443.GB4448@uranus.ravnborg.org>
References: <1201212238-4369-28-git-send-email-sam@ravnborg.org> <20080124215813.GA4204@uranus.ravnborg.org> <15193.1201566177@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15193.1201566177@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-kbuild@vger.kernel.org, WANG Cong <xiyou.wangcong@gmail.com>

On Tue, Jan 29, 2008 at 12:22:57AM +0000, David Howells wrote:
> Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > This patch drops TOPDIR from frv Makefiles.
> 
> I thought you already had a patch to do this.  Anyway, it looks reasonable,
> but I can't test it until I get back from LCA.

It is the same patch you have seen before - I just
sent my full queue for review before the merge.

	Sam
