Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59564 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751118AbaK1Pk2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Nov 2014 10:40:28 -0500
Message-ID: <54789767.1080803@suse.cz>
Date: Fri, 28 Nov 2014 16:40:23 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Fix make help-<board series> on powerpc
References: <1417179145-30789-1-git-send-email-mmarek@suse.cz>
In-Reply-To: <1417179145-30789-1-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On 2014-11-28 13:52, Michal Marek wrote:
> make ARCH=powerpc help-<board series> should not require a cofigured
> source tree. Also, sort the boards in the output.

I added this to kbuild.git#kbuild.

Michal

