Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59788 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752436AbbC3Nfx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 09:35:53 -0400
Message-ID: <55195136.3030804@suse.cz>
Date: Mon, 30 Mar 2015 15:35:50 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 kbuild for-next 1/2] makefiles: add config option to
 force all cc warnings to errors
References: <1427478671-16379-1-git-send-email-jtoppins@cumulusnetworks.com>
In-Reply-To: <1427478671-16379-1-git-send-email-jtoppins@cumulusnetworks.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Toppins <jtoppins@cumulusnetworks.com>
Cc: linux-kbuild@vger.kernel.org

On 2015-03-27 18:51, Jonathan Toppins wrote:
> Add a Kconfig option to force cc warnings to errors. For new
> development it is recommended this setting be enabled as warnings
> in the code will be quite obvious.

I don't want to add such kconfig option, because it will break
all{mod,yes}config for little gain. And there are warnings like the
preprocessor #warning or the use of a function marked as __deprecated --
these a basically TODOs and there is no point in failing the build. Test
builds can be done with KCFLAGS=-Werror or you can grep build logs.

Michal
