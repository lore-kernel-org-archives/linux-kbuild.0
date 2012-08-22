Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:54267 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755277Ab2HVInl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Aug 2012 04:43:41 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 56/74] lto, workaround: Add workaround for missing LTO symbols in igb
Date: Wed, 22 Aug 2012 08:43:35 +0000
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org> <1345345030-22211-57-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-57-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201208220843.36047.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

On Sunday 19 August 2012, Andi Kleen wrote:
> -static struct e1000_mac_operations e1000_mac_ops_82575 = {
> +/* Workaround for LTO bug */
> +__visible struct e1000_mac_operations e1000_mac_ops_82575 = {

The comment is not very clear outside the context of this patch.
Maybe change it to /* __visible added to work around an LTO but */.

	Arnd
