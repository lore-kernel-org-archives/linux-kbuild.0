Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57577 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753990AbbHXOqG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Aug 2015 10:46:06 -0400
Subject: Re: [PATCH 0/2] kbuild: Minor cleanups of fixdep
References: <1437715126-6421-1-git-send-email-yamada.masahiro@socionext.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55DB2E2B.3080500@suse.com>
Date: Mon, 24 Aug 2015 16:46:03 +0200
MIME-Version: 1.0
In-Reply-To: <1437715126-6421-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2015-07-24 07:18, Masahiro Yamada wrote:
> Masahiro Yamada (2):
>   kbuild: fixdep: optimize code slightly
>   kbuild: fixdep: drop meaningless hash table initialization
> 
>  scripts/basic/fixdep.c | 26 ++++----------------------
>  1 file changed, 4 insertions(+), 22 deletions(-)

Applied to kbuild.git#kbuild.

Michal

