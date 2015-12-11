Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40683 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754552AbbLKQ3U (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Dec 2015 11:29:20 -0500
Subject: Re: [PATCH] kbuild: support make dir/file.i for *.S
References: <20151210163329.GA18947@udknight>
From: Michal Marek <mmarek@suse.com>
Message-ID: <566AF9DE.2060304@suse.com>
Date: Fri, 11 Dec 2015 17:29:18 +0100
MIME-Version: 1.0
In-Reply-To: <20151210163329.GA18947@udknight>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 10.12.2015 v 17:33 Wang YanQing napsal(a):
> This feature could reduce a little time to expand all
> the macros in *.S for reading.
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Makes sense. Applied to kbuild.git#kbuild.

Michal

