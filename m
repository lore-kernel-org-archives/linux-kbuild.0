Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58125 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753588AbbJNOTK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2015 10:19:10 -0400
Subject: Re: [PATCH 1/2] kconfig/merge_config.sh: Support KCONFIG_CONFIG
References: <561E5F4A.3060605@gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <561E645C.3080302@suse.cz>
Date: Wed, 14 Oct 2015 16:19:08 +0200
MIME-Version: 1.0
In-Reply-To: <561E5F4A.3060605@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gabriel de Perthuis <g2p.code@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2015-10-14 15:57, Gabriel de Perthuis wrote:
> All make targets support $KCONFIG_CONFIG because they
> run scripts/kconf.  Make sure merge_config.sh accesses the
> correct file in all cases.
> 
> Previously this script broke in two different code paths,
> one for targets like kvmconfig (which use merge_config.sh -m
> then call a target that respects KCONFIG_CONFIG) and one for
> direct use of the script without -m, which called make rules
> that edit KCONFIG_CONFIG but verified a different file.
> 
> Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
> Cc: Michal Marek <mmarek@suse.cz>

Applied to kbuild.git#kconfig, thanks.

Michal

