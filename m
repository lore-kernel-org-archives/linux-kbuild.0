Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45758 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751133AbbAEJoR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Jan 2015 04:44:17 -0500
Message-ID: <54AA5CEF.50408@suse.cz>
Date: Mon, 05 Jan 2015 10:44:15 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] kbuild: Refactor ./Kbuild
References: <1420441036-5289-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1420441036-5289-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2015-01-05 07:57, Masahiro Yamada wrote:
> Changes in v2:
>   - Pass the include guard as an argument of cmd_offsets
>     as Michal Marek suggested.
> 
> Masahiro Yamada (2):
>   kbuild: merge bounds.h and asm-offsets.h rules
>   kbuild: remove redundant line from bounds.h/asm-offsets.h

Merged into kbuild.git#kbuild, thanks a lot!

Michal

