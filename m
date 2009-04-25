Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:42129 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbZDYH22 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 25 Apr 2009 03:28:28 -0400
Date: Sat, 25 Apr 2009 09:30:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Remove a tag file before it is regenerated
Message-ID: <20090425073037.GC27747@uranus.ravnborg.org>
References: <1240371503-2751-1-git-send-email-kraai@ftbfs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1240371503-2751-1-git-send-email-kraai@ftbfs.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matt Kraai <kraai@ftbfs.org>
Cc: linux-kbuild@vger.kernel.org

On Tue, Apr 21, 2009 at 08:38:23PM -0700, Matt Kraai wrote:
> If a tag file is not removed before it is regenerated, the newly
> generated data is appended to the old, which preserves stale data and
> makes the tag file grow over time.

Thanks - applied.

	Sam
