Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36911 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750842Ab2AZKK3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Jan 2012 05:10:29 -0500
Date: Thu, 26 Jan 2012 11:10:27 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: disable -Wmissing-field-initializers for W=1
Message-ID: <20120126101027.GA10637@sepie.suse.cz>
References: <1327290850-5405-1-git-send-email-kirill.shutemov@linux.intel.com>
 <20120123211834.GA3981@sepie.suse.cz>
 <20120124031014.GA12570@otc-wbsnb-06>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120124031014.GA12570@otc-wbsnb-06>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: linux-kbuild@vger.kernel.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-kernel@vger.kernel.org

On Tue, Jan 24, 2012 at 05:10:14AM +0200, Kirill A. Shutemov wrote:
> Something like this?
> 
> ---
> 
> From 9ee1c7006d14efddcb7cd52053b97aa39edf6ec3 Mon Sep 17 00:00:00 2001
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Date: Mon, 23 Jan 2012 04:59:28 +0200
> Subject: [PATCH] kbuild: disable -Wmissing-field-initializers for W=1
> 
> -Wmissing-field-initializers is too noisy to be useful on W=1. Let's
> move it to W=2.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Thanks, applied to kbuild.git#kbuild.

Michal
