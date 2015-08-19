Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40211 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751512AbbHSNsH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 09:48:07 -0400
Subject: Re: [PATCH 1/2] deb-pkg: simplify directory creation
References: <1432804275-13187-2-git-send-email-riku.voipio@linaro.org>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55D48914.4040309@suse.cz>
Date: Wed, 19 Aug 2015 15:48:04 +0200
MIME-Version: 1.0
In-Reply-To: <1432804275-13187-2-git-send-email-riku.voipio@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On 2015-05-28 11:11, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> 
> Every package needs /usr/share/doc/$package_name and
> DEBIAN directory, so create them as part of create_package
> function.
> 
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>

Applied to kbuild.git#misc.

Michal

