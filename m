Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0031.hostedemail.com ([216.40.44.31]:45519 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753205AbcCOAG3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Mar 2016 20:06:29 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 934D61729CD
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Mar 2016 23:57:07 +0000 (UTC)
Message-ID: <1457999823.11972.143.camel@perches.com>
Subject: Re: [GIT PULL v4.6]  MDB Linux Kernel Debugger x86/x86_64
From: Joe Perches <joe@perches.com>
Date: Mon, 14 Mar 2016 16:57:03 -0700
In-Reply-To: <20160314235035.GA5799@localhost.localdomain>
References: <20160314235035.GA5799@localhost.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeffrey Merkey <jeffmerkey@gmail.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, 2016-03-14 at 17:50 -0600, Jeffrey Merkey wrote:
> The following changes since commit b562e44f507e863c6792946e4e1b1449fbbac85d:
> 
>   Linux 4.5 (2016-03-13 21:28:54 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/jeffmerkey/linux.git tags/mdb-v4.5-signed
> 
> for you to fetch changes up to 2e9c184e1215dca2b4c59c347f40a0986b8e7460:
> 
>   Add MDB Debugger to linux v4.5 (2016-03-14 15:17:44 -0600)

If Linus doesn't pull this, Stephen, could you please add this
tree to -next so it has some testing and validation done?

Maybe the build-bot could do some coverage testing too?

