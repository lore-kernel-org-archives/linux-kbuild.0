Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:59064 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbZFEVxy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 17:53:54 -0400
Date: Fri, 5 Jun 2009 23:56:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Kbuild: remove extra ifdef/endif of top Makefile
Message-ID: <20090605215611.GG29008@uranus.ravnborg.org>
References: <1243324987-17840-1-git-send-email-crq@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1243324987-17840-1-git-send-email-crq@hera.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crq@hera.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, crquan@gmail.com

On Tue, May 26, 2009 at 04:03:07PM +0800, Cheng Renquan wrote:
> From: Cheng Renquan <crq@kernel.org>
> 
> The GNU make's origin function know undefined variable well,
> so the outer ifdef/endif is unneeded.
> 
> I've checked the minimal requirements from Documentation/Changes
> is GNU make 3.79.1, and that version of GNU make has support of
> origin function already, so now it's safe to kill the outer
> conditional checking, without upgrading the minimal requirements.

Applied with V2 of your description,

	Sam
