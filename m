Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:47843 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751733AbeA1QW7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jan 2018 11:22:59 -0500
Date: Sun, 28 Jan 2018 10:22:39 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] kbuild: clang: Disable -Wunused-const-variable warnings
Message-ID: <20180128162239.GZ21977@gate.crashing.org>
References: <CAK7LNAQAtPQOXPKyhrs4w7cLXoO5vpM9_Yi_=_G0gNYmNNv_FA@mail.gmail.com> <1517014786-30685-1-git-send-email-psodagud@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517014786-30685-1-git-send-email-psodagud@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: gregkh@linuxfoundation.org, mmarek@suse.com, ghackmann@google.com, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 26, 2018 at 04:59:46PM -0800, Prasad Sodagudi wrote:
> Disable -Wunused-const-variable warnings instead of
> disabling -Wunused-variable warnings, So that in both
> clang and GCC -Wunused-const-variable gets disabled.

Why would you disable -Wunused-const-variable on GCC?  You do not
explain why.


Segher
