Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40774 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752488AbbLKQc1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Dec 2015 11:32:27 -0500
Subject: Re: [PATCH] Makefile: revert "Makefile: Document ability to make
 file.lst and file.S" partially
References: <20151210163518.GB18947@udknight>
From: Michal Marek <mmarek@suse.com>
Message-ID: <566AFA99.5050503@suse.com>
Date: Fri, 11 Dec 2015 17:32:25 +0100
MIME-Version: 1.0
In-Reply-To: <20151210163518.GB18947@udknight>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>
Cc: joe@perches.com, xiyou.wangcong@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 10.12.2015 v 17:35 Wang YanQing napsal(a):
> Commit 627189797807 ("Makefile: Document ability to make file.lst
> and file.S") document ability to make file.S, but there isn't such
> ability in kbuild, so revert it.
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Thanks, applied to kbuild.git#kbuild.

Michal

