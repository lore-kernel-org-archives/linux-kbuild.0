Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49457 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754089AbbFOMih (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Jun 2015 08:38:37 -0400
Message-ID: <557EC74B.8090203@suse.cz>
Date: Mon, 15 Jun 2015 14:38:35 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Kbuild: Add ID files to .gitignore
References: <1429218161-12999-1-git-send-email-andi@firstfloor.org>
In-Reply-To: <1429218161-12999-1-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

On 2015-04-16 23:02, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> I use GNU id-utils to find code (essentially a database backed grep),
> which generates an ID file to maintain its data.
> 
> Add ID to the .gitignore file.
> 
> Signed-off-by: Andi Kleen <ak@linux.intel.com>

Applied to kbuild.git#misc now, sorry for the delay.

Michal

