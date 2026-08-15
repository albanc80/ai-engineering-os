#!/usr/bin/env python3
import json, pathlib, sys, datetime
root = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else '.').resolve()
out = root / '.ai-engineering'; out.mkdir(exist_ok=True)
state = out / 'state.json'
if state.exists(): print(f'Existing state preserved: {state}'); raise SystemExit(0)
data = {'schema_version':1,'workflow':'AI Engineering Operating System','route':None,'state':'INTAKE','gate_status':{'architecture':'N/A','security':'N/A','verification':'BLOCKED','release':'N/A'},'artifacts':{},'residual_risks':[],'updated_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
state.write_text(json.dumps(data, indent=2)+'\n'); print(f'Created {state}')
