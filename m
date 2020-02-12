Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:55868 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgBLUsy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 15:48:54 -0500
Date: Wed, 12 Feb 2020 15:48:50 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v4 0/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYM
In-Reply-To: <20200212202140.138092-1-qperret@google.com>
Message-ID: <nycvar.YSQ.7.76.2002121545120.1559@knanqh.ubzr>
References: <20200212202140.138092-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Wed, 12 Feb 2020, Quentin Perret wrote:

> The current norm on Android and many other systems is for vendors to
> introduce significant changes to their downstream kernels, and to
> contribute very little (if any) code back upstream. The Generic Kernel
> Image (GKI) project in Android attempts to improve the status-quo by
> having a unique kernel for all android devices of the same architecture,
> regardless of the SoC vendor. The key idea is to make all interested
> parties agree on a common solution, and contribute their code upstream
> to make it available to use by the wider community.
> 
> The kernel-to-drivers ABI on Android devices varies significantly from
> one vendor kernel to another today because of changes to exported
> symbols, dependencies on vendor symbols, and surely other things. The
> first step for GKI is to try and put some order into this by agreeing on
> one version of the ABI that works for everybody.
> 
> For practical reasons, we need to reduce the ABI surface to a subset of
> the exported symbols, simply to make the problem realistically solvable,
> but there is currently no upstream support for this use-case.
> 
> As such, this series attempts to improve the situation by enabling users
> to specify a symbol 'whitelist' at compile time. Any symbol specified in
> this whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is
> set, even if it has no in-tree user. The whitelist is defined as a
> simple text file, listing symbols, one per line.

For the whole series:

Acked-by: Nicolas Pitre <nico@fluxnic.net>


Nicolas
