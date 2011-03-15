Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:55157 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757831Ab1CONky (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Mar 2011 09:40:54 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glkd-linux-kbuild@m.gmane.org>)
	id 1PzUUU-0007jn-Jq
	for linux-kbuild@vger.kernel.org; Tue, 15 Mar 2011 14:40:50 +0100
Received: from 122.232.152.135 ([122.232.152.135])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Mar 2011 14:40:50 +0100
Received: from xiyou.wangcong by 122.232.152.135 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Mar 2011 14:40:50 +0100
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] KBuild: silence "'scripts/unifdef' is up to date."
Date: Tue, 15 Mar 2011 13:40:37 +0000 (UTC)
Message-ID: <ilnq8l$rjj$1@dough.gmane.org>
References: <20110315063425.9538.11565.stgit@mike.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Mon, 14 Mar 2011 23:34:25 -0700, Mike Waychison wrote:

> Patch applies to 2.6.38-rc8.
> 
> While changing our build system over to use the headers_install target
> as part of our klibc build, the following message started showing up in
> our logs:
> 
> make[2]: `scripts/unifdef' is up to date.
> 
> It turns out that the build blindly invokes a recursive make on this
> target, which causes make to emit this message when the target is
> already up to date.  This isn't seen for most targets as the rest of the
> build relies primarily on the default target and on PHONY targets when
> invoking make recursively.
> 
> Silence the above message when building unifdef as part of
> headers_install by hiding it behind a new PHONY target called
> "build_unifdef" that has an empty recipe.
> 
> Signed-off-by: Mike Waychison <mikew@google.com> ---

Acked-by: WANG Cong <xiyou.wangcong@gmail.com>

