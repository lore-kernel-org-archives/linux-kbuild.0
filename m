Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56175 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751448AbbDBOdu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 10:33:50 -0400
Message-ID: <551D534C.4060406@suse.cz>
Date: Thu, 02 Apr 2015 16:33:48 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: do not add $(bounds-file) and $(offsets-file)
 to targets
References: <1427371192-29966-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1427371192-29966-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2015-03-26 12:59, Masahiro Yamada wrote:
> $(always) is added to targets by scripts/Makefile.build.
> Moreover, filechk does not need .*.cmd files.
> 
> Adding these two files to targets is redundant.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to kbuild.git#kbuild, thanks.

Michal

