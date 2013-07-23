Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39920 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932277Ab3GWNUl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Jul 2013 09:20:41 -0400
Message-ID: <51EE8326.5030208@suse.cz>
Date: Tue, 23 Jul 2013 15:20:38 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3] kbuild: add generation of kernel-devel
References: <20130708171406.21590.49678.stgit@phlsvslse11.ph.intel.com>
In-Reply-To: <20130708171406.21590.49678.stgit@phlsvslse11.ph.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

On 8.7.2013 19:14, Mike Marciniszyn wrote:
> Change the spec file to generate a kernel-devel module
> allowing for compilation of external kernel modules.
> 
> This patch requires a new minimum RPM level of 4.0.3.
> 
> Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>

Applied to kbuild.git#misc.

Michal

