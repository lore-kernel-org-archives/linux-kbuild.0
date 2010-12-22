Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:46477 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751848Ab0LVWYb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Dec 2010 17:24:31 -0500
Date: Wed, 22 Dec 2010 23:24:29 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Make fixdep error handling more explicit
Message-ID: <20101222222429.GE21436@pobox.suse.cz>
References: <1293042614-27726-1-git-send-email-bgamari.foss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1293042614-27726-1-git-send-email-bgamari.foss@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Gamari <bgamari.foss@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, Dec 22, 2010 at 01:30:14PM -0500, Ben Gamari wrote:
> Also add missing error handling to fstat call
> 
> Signed-off-by: Ben Gamari <bgamari.foss@gmail.com>
> ---
>  scripts/basic/fixdep.c |   10 +++++++---
>  1 files changed, 7 insertions(+), 3 deletions(-)

Applied to kbuild-2.6.git#kbuild, thanks.

Michal
