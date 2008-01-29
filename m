Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:60909 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753324AbYA2AXB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Jan 2008 19:23:01 -0500
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1201212238-4369-28-git-send-email-sam@ravnborg.org>
References: <1201212238-4369-28-git-send-email-sam@ravnborg.org> <20080124215813.GA4204@uranus.ravnborg.org>
Subject: Re: [PATCH 28/77] FRV: Drop 'TOPDIR' from Makefiles
Date: Tue, 29 Jan 2008 00:22:57 +0000
Message-ID: <15193.1201566177@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dhowells@redhat.com, linux-kbuild@vger.kernel.org, WANG Cong <xiyou.wangcong@gmail.com>

Sam Ravnborg <sam@ravnborg.org> wrote:

> This patch drops TOPDIR from frv Makefiles.

I thought you already had a patch to do this.  Anyway, it looks reasonable,
but I can't test it until I get back from LCA.

David
