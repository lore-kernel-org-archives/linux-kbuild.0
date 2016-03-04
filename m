Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55454 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759326AbcCDV7u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Mar 2016 16:59:50 -0500
Subject: Re: [PATCH] kbuild/mkspec: clean boot loader configuration on rpm
 removal
References: <cf947ffc2e633b0a2b75c21bd42c2061f3c5d418.1456925798.git.pabeni@redhat.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56DA0554.3080209@suse.com>
Date: Fri, 4 Mar 2016 22:59:48 +0100
MIME-Version: 1.0
In-Reply-To: <cf947ffc2e633b0a2b75c21bd42c2061f3c5d418.1456925798.git.pabeni@redhat.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Hannes Frederic Sowa <hannes@stressinduktion.org>

Dne 2.3.2016 v 15:28 Paolo Abeni napsal(a):
> This patch add a rpm preuninstall scriptlet to cleanup the
> boot loader configuration on kernel package uninstall.
> The initrd for the to-be-removed kernel is deleted, too.
> 
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>

Applied to kbuild.git#misc.

Michal

