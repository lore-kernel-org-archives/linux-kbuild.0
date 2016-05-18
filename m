Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:43689 "EHLO
	e23smtp03.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbcERI2T (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 May 2016 04:28:19 -0400
Received: from localhost
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
	Wed, 18 May 2016 18:28:16 +1000
Subject: Re: [kernel-hardening] [PATCH v8 3/4] Add Cyclomatic complexity GCC
 plugin
References: <20160513015456.01415979f20a68eb7d2d9290@gmail.com>
 <20160513015833.cfb5334d075525b27269649c@gmail.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Message-ID: <573C26DC.6020607@au1.ibm.com>
Date: Wed, 18 May 2016 18:25:00 +1000
MIME-Version: 1.0
In-Reply-To: <20160513015833.cfb5334d075525b27269649c@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org
Cc: pageexec@freemail.hu, spender@grsecurity.net, mmarek@suse.com, keescook@chromium.org, linux@rasmusvillemoes.dk, fengguang.wu@intel.com, dvyukov@google.com, linux-kernel@vger.kernel.org, david.brown@linaro.org, yamada.masahiro@socionext.com

On 13/05/16 09:58, Emese Revfy wrote:
> Add a very simple plugin to demonstrate the GCC plugin infrastructure. This GCC
> plugin computes the cyclomatic complexity of each function.

...

> +config GCC_PLUGIN_CYC_COMPLEXITY
> +	bool "Compute the cyclomatic complexity of a function"
> +	depends on GCC_PLUGINS
> +	help
> +	  The complexity M of a function's control flow graph is defined as:
> +	   M = E - N + 2P
> +	  where
> +
> +	  E = the number of edges
> +	  N = the number of nodes
> +	  P = the number of connected components (exit nodes).
> +

If this plugin is intended primarily as a demonstration it's probably 
worth mentioning this in the Kconfig description.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

