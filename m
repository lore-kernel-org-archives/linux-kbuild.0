Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34584 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752096AbbCXPjW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Mar 2015 11:39:22 -0400
Message-ID: <55118527.8020709@suse.cz>
Date: Tue, 24 Mar 2015 16:39:19 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: remove warning about "make depend"
References: <1422960226-10298-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1422960226-10298-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2015-02-03 11:43, Masahiro Yamada wrote:
> Enough time has passed since "make depend" was deprecated.
> Nobody would be in trouble without this hint.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

I won't be surprised if some build script suddenly breaks. But such
script has it coming :). Applied to kbuild.git#kbuild.

Michal
