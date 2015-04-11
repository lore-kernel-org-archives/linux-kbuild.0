Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:49084 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753843AbbDKNPc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Apr 2015 09:15:32 -0400
Date: Sat, 11 Apr 2015 15:15:23 +0200
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] kbuild: add documentation of KBUILD_BUILD_VERSION
Message-ID: <20150411151523.1756ec20@lwn.net>
In-Reply-To: <1428216268-3545-1-git-send-email-hofrat@osadl.org>
References: <1428216268-3545-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun,  5 Apr 2015 08:44:28 +0200
Nicholas Mc Guire <hofrat@osadl.org> wrote:

> KBUILD_BUILD_VERSION is currently not documented but it is
> needed when rebuilding a kernel that should result in the identical
> binary. This is a brief documentation of KBUILD_BUILD_VERSION.

Can we add something like the above to the document itself so that
readers have an idea of why they might want to tweak this?

Either way, I can take it in the docs tree if that's best..Michal?

Thanks,

jon
