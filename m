Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:47137 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758952Ab3E3S75 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 May 2013 14:59:57 -0400
Received: from merkur.ravnborg.org (unknown [188.228.89.252])
	by smtp.domainteam.dk (Postfix) with ESMTPA id 5DF37F19F1
	for <linux-kbuild@vger.kernel.org>; Thu, 30 May 2013 20:59:56 +0200 (CEST)
Date: Thu, 30 May 2013 20:59:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] let kbuild mkdir for dir/file.o
Message-ID: <20130530185955.GA32140@merkur.ravnborg.org>
References: <1369807633-4364-1-git-send-email-zzs0213@gmail.com> <20130530015948.GA7875@greatfirst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130530015948.GA7875@greatfirst.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

On Thu, May 30, 2013 at 09:59:48AM +0800, 张忠山 wrote:
> Is this patch wrong, Or I make mistake when send email?
> 
> Why nobody say anything?

It takes some time to review this part of kbuild - please be patient.
After one week try to ping for comments.

You could also consider to explain a little better in the changelog.
Reference a old commit with ID + title like this:
SHA-1 ("kbuild: bla bla").

Then maybe poeple do not need to look it up.

Etc.

	Sam
