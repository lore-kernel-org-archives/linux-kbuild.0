Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:53682 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753176AbZK3RNm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Nov 2009 12:13:42 -0500
Message-ID: <4B13FD4B.5080805@suse.cz>
Date: Mon, 30 Nov 2009 18:13:47 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: specify absolute paths for cscope
References: <1259238852-21214-1-git-send-email-daniel.vetter@ffwll.ch>
In-Reply-To: <1259238852-21214-1-git-send-email-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On 26.11.2009 13:34, Daniel Vetter wrote:
> Some tools (like my favourite editor, vim) can't handle relative
> paths from cscope as soon as cscope.out is no longer in $PWD. Use
> absolute paths when generating cscope.files, which seems to be
> the recommended way to generate cscope.out, anyway (at least according
> to cscope.sf.net).

But it will fail if you rename the source directory. I'm not sure what
is worse, I myself don't use cscope much. Fixing vim would be the ideal
solution of course (it already handles ../tags fine).

Michal
