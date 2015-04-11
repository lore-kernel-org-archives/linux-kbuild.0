Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hofr.at ([212.69.189.236]:33197 "EHLO mail.hofr.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755203AbbDKNUZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Apr 2015 09:20:25 -0400
Date: Sat, 11 Apr 2015 15:20:23 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH] kbuild: add documentation of KBUILD_BUILD_VERSION
Message-ID: <20150411132023.GA22172@opentech.at>
References: <1428216268-3545-1-git-send-email-hofrat@osadl.org> <20150411151523.1756ec20@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150411151523.1756ec20@lwn.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Nicholas Mc Guire <hofrat@osadl.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 11 Apr 2015, Jonathan Corbet wrote:

> On Sun,  5 Apr 2015 08:44:28 +0200
> Nicholas Mc Guire <hofrat@osadl.org> wrote:
> 
> > KBUILD_BUILD_VERSION is currently not documented but it is
> > needed when rebuilding a kernel that should result in the identical
> > binary. This is a brief documentation of KBUILD_BUILD_VERSION.
> 
> Can we add something like the above to the document itself so that
> readers have an idea of why they might want to tweak this?
> 
> Either way, I can take it in the docs tree if that's best..Michal?
>
I thought of that but it would be inconsistent as all other descriptions
here are only the function not the use. I did not find a file where 
the problem of identical rebuild would really fit.

thx!
hofrat 
