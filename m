Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37233 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751486AbcDROq6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2016 10:46:58 -0400
Subject: Re: [PATCH] tools: Use builtin $(abspath ...) instead of $(shell cd
 ... && pwd)
References: <1460106959-6684-1-git-send-email-thierry.reding@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5714F35D.5050603@suse.com>
Date: Mon, 18 Apr 2016 16:46:53 +0200
MIME-Version: 1.0
In-Reply-To: <1460106959-6684-1-git-send-email-thierry.reding@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-04-08 11:15, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Avoid forking off a shell to resolve the absolute path of the output
> directory when make's builtin $(abspath ...) function will do an
> adequate job.

The abspath function is not available in make 3.80.

Michal

